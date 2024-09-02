<?php 
class UserIdentity extends CUserIdentity
{
	private $_id;

	public function authenticate()

	{

			$record=User::model()->findByAttributes(array('username'=>$this->username));  // here I username as user name which comes from database
			if($record===null)
				{
					$this->_id='user Null';
					$this->errorCode=self::ERROR_USERNAME_INVALID;
				}

			else if($record->password!==$this->password)            // here I compare db password with passwod field
				{
					$this->_id=$this->username;
					$this->errorCode=self::ERROR_PASSWORD_INVALID;
				}

			else
				{  
					$this->_id=$record['username'];
					$this->setState('title', $record['username']);
					$this->errorCode=self::ERROR_NONE;
				}

			return !$this->errorCode;

	}

    public function getId() {
        return $this->_id;
    }
}
?>
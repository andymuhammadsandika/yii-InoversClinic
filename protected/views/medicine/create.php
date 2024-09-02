<?php
/* @var $this MedicineController */
/* @var $model Medicine */

$this->breadcrumbs=array(
	'Medicines'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Medicine', 'url'=>array('index')),
	array('label'=>'Manage Medicine', 'url'=>array('admin')),
);
?>

<h1>Create Medicine</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>
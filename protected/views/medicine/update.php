<?php
/* @var $this MedicineController */
/* @var $model Medicine */

$this->breadcrumbs=array(
	'Medicines'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Medicine', 'url'=>array('index')),
	array('label'=>'Create Medicine', 'url'=>array('create')),
	array('label'=>'View Medicine', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Medicine', 'url'=>array('admin')),
);
?>

<h1>Update Medicine <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>
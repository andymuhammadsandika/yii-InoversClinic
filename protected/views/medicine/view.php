<?php
/* @var $this MedicineController */
/* @var $model Medicine */

$this->breadcrumbs=array(
	'Medicines'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Medicine', 'url'=>array('index')),
	array('label'=>'Create Medicine', 'url'=>array('create')),
	array('label'=>'Update Medicine', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Medicine', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Medicine', 'url'=>array('admin')),
);
?>

<h1>View Medicine #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'description',
		'price',
		'stock',
		'created_at',
		'updated_at',
	),
)); ?>

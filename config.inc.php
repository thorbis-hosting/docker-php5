<?php
$cfg['blowfish_secret']='{{random 32}}';
$cfg['Servers'][0]['auth_type']='cookie';
$cfg['Servers'][0]['host']='mysql';
$cfg['Servers'][0]['compress']=false;
$cfg['Servers'][0]['extension']='mysqli';
$cfg['Servers'][0]['AllowNoPassword']=false;
$cfg['ServerDefault']=0;
$cfg['UploadDir']='';
$cfg['SaveDir']='';



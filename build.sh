#!/usr/bin/env php
<?php

$ch = curl_init('https://api.github.com/markdown/raw');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents('resume.md'));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: text/plain'));

$response = curl_exec($ch);


$template = file_get_contents('template.html');

file_put_contents('index.html', str_replace('{{ body }}', $response, $template));

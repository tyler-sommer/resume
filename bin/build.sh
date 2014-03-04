#!/usr/bin/env php
<?php

$ch = curl_init('https://api.github.com/markdown/raw');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents(__DIR__ . '/../resume.md'));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: text/plain'));
curl_setopt($ch, CURLOPT_USERAGENT, 'Tyler Sommer\'s Resume Builder');

$response = curl_exec($ch);


$template = file_get_contents(__DIR__ . '/../views/template.html');

file_put_contents(__DIR__ . '/../web/index.html', str_replace('{{ body }}', $response, $template));

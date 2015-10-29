<?php
$file = __DIR__ . '/../css/grocery_bag_fonts.css';
$url = 'https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic|Oswald:400,300,700';
$css  = file_get_contents($url);

if (preg_match_all("/https.*\.ttf/", $css, $matches))
{
    foreach ($matches[0] as $font)
    {
        $destination = 'google/' . basename($font);
        if (!file_exists($destination))
        {
            echo $font."\n";
            file_put_contents($destination, file_get_contents($font));
        }
        $css = str_replace($font, '../fonts/' . $destination, $css);
    }
}
file_put_contents($file, $css);

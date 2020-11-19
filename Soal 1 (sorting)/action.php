<?php
$input = $_POST[input];
$input = str_split(strval($input));

sortManual($input);

function sortManual(array $array){
	$count = count($array);
	$hitung = 0;
	for ($i = 0; $i < $count; $i++) {
        for ($j = $i + 1; $j < $count; $j++) {
        	
            if ($array[$i] > $array[$j]) {
            	// $hitung+1;
            	echo $hitung+1;
            	echo ". ";
                $temp = $array[$i];
                $array[$i] = $array[$j];
                $array[$j] = $temp;
                echo "[".$array[$i].",";
                echo $array[$j]."]";
                echo " -> ";
                foreach ($array as $key) {
                	echo $key." ";
                }
                echo "<br>";
             	$hitung = $hitung +1;   //echo $temp;
            }
        }
        
    }
    echo "<br>";
    echo "Jumlah Swap : ". $hitung;

}
?>
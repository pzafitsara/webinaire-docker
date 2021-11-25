<?php
    // PHP > 5.4
    $users = ["Foo", "Bar", "Unknwow", "Teste"];
    // $users = array("Foo", "Bar", "Unknwow", "Teste");

    echo "<center><u>Liste des animaux:</u></br><br/>";
    foreach($users as $i => $user) {
        echo "Aminal N# " . ++$i . ": " . $user . "<br/>";
    }
    echo "</center></br></br>";

    phpinfo();

    

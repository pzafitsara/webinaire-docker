<?php
    // PHP > 5.4
    $users = array("Foo", "Bar", "Unknwow");

    echo "<center><br/><br/><u>Liste des utilisateurs:</u><br/><br/>";
    foreach($users as $i => $user) {
        echo "Utilisateur N# " . ++$i . ": " . $user . "<br/>";
    }
    echo "</center></br></br>";

    phpinfo();

    

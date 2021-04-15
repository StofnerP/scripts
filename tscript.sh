#!/bin/sh
name=$1
if [[ $name != *".sh" ]]; then
	name=$name".sh"
fi
echo "#!/bin/bash\n" > $name
chmod +x $name
vim $name

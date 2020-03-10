#!/usr/bin/env sh
echo "Getting colours from xrdb"
colours=$(xrdb -query | grep "color" | sed 's/*.color//g' | sort -n | awk -F "#" '{ print $2 }')
bg=$(xrdb -query | grep "background" | awk -F "#" '{ print $2 }')

echo "Writing to '$HOME/bin/ttycol.sh'"
(
	echo '#!/usr/bin/env bash'
	echo 'export TERM=linux'
	echo 'for tty in /dev/tty[0-9]; do'

	i=0
	for c in $colours; do
		case $i in
		0) c=$bg; n=$i;;
		10) n=A ;;
		11) n=B ;;
		12) n=C ;;
		13) n=D ;;
		14) n=E ;;
		15) n=F ;;
		*) n=$i ;;
		esac
		echo "echo -en \"\e]P$n$c\" > \"\$tty\""
		i=$((i + 1))
	done

	echo 'done'

) >"$HOME/.cache/ttycol.sh"

echo "Marking ttycol.sh as executable"
chmod a+x "$HOME/.cache/ttycol.sh"

echo "Moving ttycol.sh to /usr/local/bin/"
sudo mv "$HOME/.cache/ttycol.sh" /usr/local/bin/
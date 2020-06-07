echo "run.sh called!!!!!"
cd ../extern/uWebSockets
if [[ -f "uSockets/uSockets.a" ]]
then
    echo "uSockets already built"
else
    make
fi

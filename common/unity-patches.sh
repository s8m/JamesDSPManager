# v DO NOT MODIFY v
# See instructions file for predefined variables
# Add patches (such as audio config) here (starting at line 9)
# NOTE: Destination variable must have '$AMLPATCH' in front of it
# Patch Ex: sed -i '/v4a_standard_fx {/,/}/d' $AMLPATCH$CONFIG_FILE
#
#
# ^ DO NOT MODIFY ^
ui_print "    Patching existing audio_effects files..."
for CFG in $CONFIG_FILE $HTC_CONFIG_FILE $OTHER_V_FILE $OFFLOAD_CONFIG $V_CONFIG_FILE; do
  if [ -f $CFG ] && [ ! "$(cat $AMLPATH$CFG | grep ' am3daudioenhancement {')" ]; then
    sed -i 's/^effects {/effects {\n  am3daudioenhancement {\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  }/g' $AMLPATCH$CFG
    sed -i 's/^libraries {/libraries {\n  am3daudioenhancement {\n    path \/system\/lib\/soundfx\/libam3daudioenhancement.so\n  }/g' $AMLPATCH$CFG
  fi
done
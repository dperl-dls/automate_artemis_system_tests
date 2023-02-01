# for jenkins export BUILD_ID=$BUILD_ID
# to make sure subshell processes are cleaned
# https://stackoverflow.com/questions/25402350/jenkins-kill-all-child-processes
git clone git@github.com:DiamondLightSource/python-artemis.git
cd python-artemis
source dls_dev_env.sh
module load dials/latest
source fake_zocalo/dls_start_fake_zocalo.sh &
cd ..
git clone git@gitlab.diamond.ac.uk:controls/python3/s03_utils.git
cd s03_utils
module load gcloud
source pods/s03/shutdown.sh
source pods/s03/update.sh
source pods/s03/launch.sh -f
cd ../python-artemis
python -m pytest


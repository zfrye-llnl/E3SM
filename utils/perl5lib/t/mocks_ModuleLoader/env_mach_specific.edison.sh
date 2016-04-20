#!/usr/bin/env sh -f
#===============================================================================
# Automatically generated module settings for edison
# DO NOT EDIT THIS FILE DIRECTLY!  Please edit env_mach_specific.xml
# in your CASEROOT. This file is overwritten every time modules are loaded!
#===============================================================================

.  /opt/modules/default/init/sh
CIME_REPO=`./xmlquery CIME_REPOTAG -value`
if [ -n $CIME_REPO  ]
then
  COMPILER=`./xmlquery  COMPILER          -value`
  MPILIB=`./xmlquery  MPILIB        -value`
  DEBUG=`./xmlquery  DEBUG         -value`
  OS=`./xmlquery  OS        -value`
  PROFILE_PAPI_ENABLE=`./xmlquery  PROFILE_PAPI_ENABLE -value`
fi
module rm PrgEnv-intel
module rm PrgEnv-cray
module rm PrgEnv-gnu
module rm intel
module rm cce
module rm cray-parallel-netcdf
module rm cray-parallel-hdf5
module rm pmi
module rm cray-libsci
module rm cray-mpich2
module rm cray-mpich
module rm cray-netcdf
module rm cray-hdf5
module rm cray-netcdf-hdf5parallel
module rm craype-sandybridge
module rm craype-ivybridge
module rm craype
if [ "$COMPILER" = "intel" ]
then
	module load PrgEnv-intel
	module switch intel intel/15.0.1.133
	module rm cray-libsci
	module use /global/project/projectdirs/ccsm1/modulefiles/edison
fi
if [ "$COMPILER" = "intel" ] && [ "$DEBUG" = "true" ]
then
	module load esmf/6.2.0-defio-mpi-g
fi
if [ "$COMPILER" = "intel" ] && [ "$DEBUG" = "false" ]
then
	module load esmf/6.2.0-defio-mpi-O
fi
if [ "$COMPILER" = "cray" ]
then
	module load PrgEnv-cray
	module switch cce cce/8.3.7
fi
if [ "$COMPILER" = "gnu" ]
then
	module load PrgEnv-gnu
	module switch gcc gcc/4.8.0
fi
module load papi/5.3.2
module swap craype craype/2.1.1
module load craype-ivybridge
if [ "$COMPILER" != "intel" ]
then
	module load cray-libsci/13.0.1
fi
module load cray-mpich/7.1.1
module load pmi/5.0.6-1.0000.10439.140.2.ari
if [ "$MPILIB" = "mpi-serial" ]
then
	module load cray-hdf5/1.8.11
	module load cray-netcdf/4.3.0
fi
if [ "$MPILIB" != "mpi-serial" ]
then
	module load cray-netcdf-hdf5parallel/4.3.2
	module load cray-hdf5-parallel/1.8.13
	module load cray-parallel-netcdf/1.5.0
fi
module load perl/5.20.0
module load cmake/2.8.11.2
export MPICH_ENV_DISPLAY=1
export MPICH_VERSION_DISPLAY=1
export PERL5LIB=/global/project/projectdirs/ccsm1/perl5lib/lib/perl5/5.10.0

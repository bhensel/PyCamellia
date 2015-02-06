CAMELLIA_INCLUDE=/Users/nroberts/Camellia/src/include
CAMELLIA_LIB_DIR=/Users/nroberts/Camellia/build/mpi-debug-shared
CPP=/Users/nroberts/lib/openmpi-1.8.3/bin/mpicxx
PYTHON_INCLUDE=/System/Library/Frameworks/Python.framework/Versions/Current/include/python2.7
TRILINOS_INCLUDE=/Users/nroberts/lib/trilinos/mpi-debug-shared/include
HDF5_INCLUDE=/Users/nroberts/lib/hdf5/include
OPEN_MPI_INCLUDE=/Users/nroberts/openmpi-1.8.3/include

Trilinos_INCLUDE_DIRS=/Users/nroberts/lib/trilinos/mpi-debug-shared/include
Trilinos_LIBRARY_DIRS=/Users/nroberts/lib/trilinos/mpi-debug-shared/lib

Trilinos_LIBRARIES=pytrilinos;locathyra;locaepetra;localapack;loca;noxepetra;noxlapack;nox;intrepid;stratimikos;stratimikosbelos;stratimikosaztecoo;stratimikosamesos;stratimikosml;stratimikosifpack;anasazitpetra;ModeLaplace;anasaziepetra;anasazi;belostpetra;belosepetra;belos;ml;komplex;ifpack;pamgen_extras;pamgen;amesos;galeri-xpetra;galeri;aztecoo;dpliris;isorropia;thyraepetraext;thyraepetra;thyracore;thyraepetraext;thyraepetra;thyracore;xpetra-sup;xpetra-ext;xpetra;epetraext;tpetraext;tpetrainout;tpetra;triutils;shards;zoltan;epetra;sacado;rtop;tpi;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore
Trilinos_LIBRARIES_LINK_LINE=-lpytrilinos -llocathyra -llocaepetra -llocalapack -lloca -lnoxepetra -lnoxlapack -lnox -lintrepid -lstratimikos -lstratimikosbelos -lstratimikosaztecoo -lstratimikosamesos -lstratimikosml -lstratimikosifpack -lanasazitpetra -lModeLaplace -lanasaziepetra -lanasazi -lbelostpetra -lbelosepetra -lbelos -lml -lkomplex -lifpack -lpamgen_extras -lpamgen -lamesos -lgaleri-xpetra -lgaleri -laztecoo -ldpliris -lisorropia -lthyraepetraext -lthyraepetra -lthyracore -lthyraepetraext -lthyraepetra -lthyracore -lxpetra-sup -lxpetra-ext -lxpetra -lepetraext -ltpetraext -ltpetrainout -ltpetra -ltriutils -lshards -lzoltan -lepetra -lsacado -lrtop -ltpi -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore

INCLUDE_ALL=-I${PYTHON_INCLUDE} -I${CAMELLIA_INCLUDE} -I${Trilinos_INCLUDE_DIRS} -I${HDF5_INCLUDE}
LINK_ALL=-lpython2.7 -L${Trilinos_LIBRARY_DIRS} ${Trilinos_LIBRARIES_LINK_LINE} -L${CAMELLIA_LIB_DIR} -lCamellia
#echo ${LINK_ALL}

%_wrap.cxx : %.i
	swig -Wall -c++ -python -I${CAMELLIA_INCLUDE} $< 

%_wrap.o : %_wrap.cxx
	${CPP} -c -Wall -fpic $< ${INCLUDE_ALL}

_%.so : %_wrap.o
	${CPP} -shared $< -o $@ ${LINK_ALL}

% : _%.so ;

all : Var VarFactory Function LinearTerm IP BF SpatialFilter BC RHS PoissonFormulation Mesh MeshFactory Solution HDF5Exporter

.PRECIOUS : _%.so
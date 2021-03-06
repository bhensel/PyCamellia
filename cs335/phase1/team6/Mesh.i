%module Mesh
%{
#include "Mesh.h"
%}

%include "std_string.i"
%include "std_vector.i"
%include "std_set.i"

%nodefaultctor Mesh;  // Disable the default constructor for class Mesh

class Mesh {
public:
  void saveToHDF5(string filename);
  int cellPolyOrder(GlobalIndexType cellID);
  set<GlobalIndexType> getActiveCellIDs();
  int getDimension();
  void hRefine(const set<GlobalIndexType> &cellIDs);
  GlobalIndexType numActiveElements();
  GlobalIndexType numFluxDofs();
  GlobalIndexType numFieldDofs();
  GlobalIndexType numGlobalDofs();
  GlobalIndexType numElements();
  void pRefine(const set<GlobalIndexType> &cellIDsForPRefinments);
  void registerSolution(SolutionPtr solution);
  vector<unsigned> vertexIndicesForCell(GlobalIndexType cellID);
  vector< vector<double> > verticesForCell(GlobalIndexType cellID);
};

class MeshPtr {
public:
  Mesh* operator->();
};

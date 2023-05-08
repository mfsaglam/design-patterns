import Foundation

class Neuron: Sequence {
    var inputs = [Neuron]()
    var outputs = [Neuron]()
    
    func makeIterator() -> IndexingIterator<Array<Neuron>> {
        return IndexingIterator(_elements: [self])
    }
    
    func connect(to neuron: Neuron) {
        outputs.append(neuron)
        neuron.inputs.append(self)
    }
}

class NeuronLayer: Sequence {
    private var neurons: [Neuron]
    
    func makeIterator() -> IndexingIterator<Array<Neuron>> {
        IndexingIterator(_elements: neurons)
    }
    
    init(_ count: Int) {
        neurons = [Neuron](repeating: Neuron(), count: count)
    }
}

extension Sequence {
    func connect<Seq: Sequence>(to otherNeurons: Seq)
    where Seq.Iterator.Element == Neuron,
    Self.Iterator.Element == Neuron {
        for neuron in self {
            for otherNeuron in otherNeurons {
                neuron.outputs.append(otherNeuron)
                otherNeuron.inputs.append(neuron)
            }
        }
    }
}

func main() {
    var neuron1 = Neuron()
    var neuron2 = Neuron()
    var layer1 = NeuronLayer(10)
    var layer2 = NeuronLayer(20)
    
    neuron1.connect(to: neuron2)
    neuron1.connect(to: layer1)
    layer1.connect(to: neuron1)
    layer1.connect(to: layer2)
}

main()

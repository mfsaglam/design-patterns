import Foundation

class Neuron {
    var inputs = [Neuron]()
    var outputs = [Neuron]()
    
    func connect(to neuron: Neuron) {
        outputs.append(neuron)
        neuron.inputs.append(self)
    }
}

class NeuronLayer {
    private var neurons: [Neuron]
    
    init(_ count: Int) {
        neurons = [Neuron](repeating: Neuron(), count: count)
    }
}

func main() {
    var neuron1 = Neuron()
    var neuron2 = Neuron()
    var layer1 = NeuronLayer(10)
    var layer2 = NeuronLayer(20)
}

main()

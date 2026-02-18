#!/bin/bash
# Download script for Ilya Sutskever's reading list
# Papers recommended to John Carmack

set -e  # Exit on any error

DIR="/home/node/.openclaw/workspace/ilya-30-papers"
cd "$DIR"

echo "📚 Downloading Ilya Sutskever's Reading List Papers..."
echo "=================================================="

download_paper() {
    local num="$1"
    local filename="$2"
    local url="$3"
    local title="$4"
    local fullpath="$DIR/${num}-${filename}.pdf"
    
    printf "%-3s %-50s " "$num." "$title"
    
    if [ -f "$fullpath" ] && [ $(stat -c%s "$fullpath" 2>/dev/null || echo 0) -gt 100000 ]; then
        echo "✅ Already exists"
        return 0
    fi
    
    echo "⬇️  Downloading..."
    if curl -L --max-time 60 --retry 3 --retry-delay 2 -s -o "$fullpath" "$url" 2>/dev/null; then
        local size=$(stat -c%s "$fullpath" 2>/dev/null || echo 0)
        if [ "$size" -gt 100000 ]; then
            local mb_size=$(python3 -c "print(f'{$size/1048576:.1f}')" 2>/dev/null || echo "?")
            printf "    ✅ Downloaded successfully (%sMB)\n" "$mb_size"
        else
            echo "    ❌ Download failed or file too small (${size} bytes)"
            rm -f "$fullpath" 2>/dev/null
            return 1
        fi
    else
        echo "    ❌ Download failed"
        rm -f "$fullpath" 2>/dev/null
        return 1
    fi
}

echo ""
echo "🔽 Downloading ArXiv Papers..."
echo "==============================="

# Core neural network papers
download_paper "05" "recurrent-neural-network-regularization" "https://arxiv.org/pdf/1409.2329.pdf" "RNN Regularization"
download_paper "07" "pointer-networks" "https://arxiv.org/pdf/1506.03134.pdf" "Pointer Networks"
download_paper "09" "order-matters-seq2seq-sets" "https://arxiv.org/pdf/1511.06391.pdf" "Order Matters: Seq2Seq for Sets"
download_paper "10" "gpipe-pipeline-parallelism" "https://arxiv.org/pdf/1811.06965.pdf" "GPipe: Pipeline Parallelism"
download_paper "11" "resnet-deep-residual-learning" "https://arxiv.org/pdf/1512.03385.pdf" "ResNet: Deep Residual Learning"
download_paper "12" "dilated-convolutions-context" "https://arxiv.org/pdf/1511.07122.pdf" "Dilated Convolutions"
download_paper "13" "neural-message-passing-chemistry" "https://arxiv.org/pdf/1704.01212.pdf" "Neural Message Passing"
download_paper "14" "attention-is-all-you-need" "https://arxiv.org/pdf/1706.03762.pdf" "Attention Is All You Need"
download_paper "15" "neural-machine-translation-attention" "https://arxiv.org/pdf/1409.0473.pdf" "Neural Machine Translation w/ Attention"
download_paper "16" "identity-mappings-resnet" "https://arxiv.org/pdf/1603.05027.pdf" "Identity Mappings in ResNet"
download_paper "17" "relational-reasoning-module" "https://arxiv.org/pdf/1706.01427.pdf" "Relational Reasoning Module"
download_paper "18" "variational-lossy-autoencoder" "https://arxiv.org/pdf/1611.02731.pdf" "Variational Lossy Autoencoder"
download_paper "19" "relational-recurrent-networks" "https://arxiv.org/pdf/1806.01822.pdf" "Relational RNNs"
download_paper "20" "neural-turing-machines" "https://arxiv.org/pdf/1410.5401.pdf" "Neural Turing Machines"
download_paper "21" "deep-speech-2" "https://arxiv.org/pdf/1512.02595.pdf" "Deep Speech 2"
download_paper "22" "scaling-laws-language-models" "https://arxiv.org/pdf/2001.08361.pdf" "Scaling Laws for LMs"
download_paper "23" "minimum-description-length" "https://arxiv.org/pdf/math/0406077.pdf" "MDL Principle Tutorial"
download_paper "24" "grokking-generalization" "https://arxiv.org/pdf/2201.02177.pdf" "Grokking: Generalization"
download_paper "27" "generative-adversarial-nets" "https://arxiv.org/pdf/1406.2661.pdf" "Generative Adversarial Nets"
download_paper "28" "adam-optimizer" "https://arxiv.org/pdf/1412.6980.pdf" "Adam Optimizer"
download_paper "30" "batch-normalization" "https://arxiv.org/pdf/1502.03167.pdf" "Batch Normalization"

echo ""
echo "📄 Downloading Published Papers..."
echo "================================="

# AlexNet from NIPS
download_paper "08" "alexnet-imagenet-classification" "https://proceedings.neurips.cc/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf" "AlexNet"

# Bengio language model from JMLR
download_paper "25" "neural-probabilistic-language-model" "https://www.jmlr.org/papers/volume3/bengio03a/bengio03a.pdf" "Neural Language Model (Bengio)"

# Dropout paper from JMLR
download_paper "29" "dropout-regularization" "https://jmlr.org/papers/volume15/srivastava14a/srivastava14a.pdf" "Dropout"

# Hinton & van Camp paper (try multiple sources)
download_paper "06" "keeping-networks-simple-mdl" "https://www.cs.toronto.edu/~hinton/absps/colt93.pdf" "Keeping Networks Simple (MDL)"

echo ""
echo "🎓 Attempting Institutional Papers..."
echo "====================================="

# Shane Legg's thesis
download_paper "26" "machine-super-intelligence" "https://www.vetta.org/documents/Machine_Super_Intelligence.pdf" "Machine Super Intelligence"

echo ""
echo "📊 Download Summary"
echo "=================="

total_files=$(ls -1 *.pdf 2>/dev/null | wc -l)
total_size=$(du -sh *.pdf 2>/dev/null | awk '{sum+=$1} END {print sum"M"}' 2>/dev/null || echo "0M")

echo "✅ Downloaded: $total_files PDF files"
echo "💾 Total size: $total_size"

echo ""
echo "📋 Files downloaded:"
ls -1 *.pdf 2>/dev/null | sort -V | nl -w3 -s'. ' || echo "No PDF files found"

echo ""
echo "⚠️  Note: The following are blog posts/tutorials (no PDFs):"
echo "   1. The Annotated Transformer (Harvard NLP tutorial)"
echo "   2. The First Law of Complexodynamics (Scott Aaronson blog)"
echo "   3. The Unreasonable Effectiveness of RNNs (Karpathy blog)"
echo "   4. Understanding LSTM Networks (Christopher Olah blog)"

echo ""
echo "🔗 See README.md for all URLs and reading order suggestions"
echo "Done! 🎉"
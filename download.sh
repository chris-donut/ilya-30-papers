#!/bin/bash
# Download script for Ilya Sutskever's reading list
# Papers recommended to John Carmack

DIR="/home/node/.openclaw/workspace/ilya-30-papers"
mkdir -p "$DIR"
cd "$DIR"

download_paper() {
    local num="$1"
    local filename="$2"
    local url="$3"
    local fullpath="$DIR/${num}-${filename}.pdf"
    
    if [ -f "$fullpath" ] && [ $(stat -c%s "$fullpath" 2>/dev/null || echo 0) -gt 100000 ]; then
        echo "✓ Already exists: ${num}-${filename}.pdf"
        return 0
    fi
    
    echo "Downloading: ${num}-${filename}.pdf"
    curl -L --max-time 60 --retry 3 -s -o "$fullpath" "$url"
    
    local size=$(stat -c%s "$fullpath" 2>/dev/null || echo 0)
    if [ "$size" -gt 100000 ]; then
        echo "✓ Downloaded: ${num}-${filename}.pdf (${size} bytes)"
    else
        echo "✗ Failed or too small: ${num}-${filename}.pdf (${size} bytes)"
        # Try to check if it's HTML (error page)
        local filetype=$(file "$fullpath" 2>/dev/null)
        echo "  File type: $filetype"
    fi
}

# 1. Recurrent Neural Network Regularization (Zaremba et al., 2014)
download_paper "01" "recurrent-neural-network-regularization" "https://arxiv.org/pdf/1409.2329.pdf"

# 2. Keeping Neural Networks Simple (Hinton & van Camp, 1993) - via semanticscholar
download_paper "02" "keeping-neural-networks-simple-mdl" "https://www.cs.toronto.edu/~hinton/absps/colt93.pdf"

# 3. Pointer Networks (Vinyals et al., 2015)
download_paper "03" "pointer-networks" "https://arxiv.org/pdf/1506.03134.pdf"

# 4. ImageNet Classification with Deep CNNs - AlexNet (Krizhevsky et al., 2012)
download_paper "04" "alexnet-imagenet-classification" "https://proceedings.neurips.cc/paper_files/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf"

# 5. Order Matters: Sequence to Sequence for Sets (Vinyals et al., 2016)
download_paper "05" "order-matters-seq2seq-for-sets" "https://arxiv.org/pdf/1511.06391.pdf"

# 6. GPipe: Efficient Training of Giant Neural Networks (Huang et al., 2019)
download_paper "06" "gpipe-pipeline-parallelism" "https://arxiv.org/pdf/1811.06965.pdf"

# 7. Deep Residual Learning for Image Recognition - ResNet (He et al., 2016)
download_paper "07" "deep-residual-learning-resnet" "https://arxiv.org/pdf/1512.03385.pdf"

# 8. Multi-Scale Context Aggregation by Dilated Convolutions (Yu & Koltun, 2016)
download_paper "08" "multi-scale-context-aggregation-dilated-convolutions" "https://arxiv.org/pdf/1511.07122.pdf"

# 9. Neural Message Passing for Quantum Chemistry (Gilmer et al., 2017)
download_paper "09" "neural-message-passing-quantum-chemistry" "https://arxiv.org/pdf/1704.01212.pdf"

# 10. Attention Is All You Need - Transformer (Vaswani et al., 2017)
download_paper "10" "attention-is-all-you-need" "https://arxiv.org/pdf/1706.03762.pdf"

# 11. Neural Machine Translation by Jointly Learning to Align and Translate (Bahdanau et al., 2015)
download_paper "11" "neural-machine-translation-attention-bahdanau" "https://arxiv.org/pdf/1409.0473.pdf"

# 12. Identity Mappings in Deep Residual Networks (He et al., 2016)
download_paper "12" "identity-mappings-deep-residual-networks" "https://arxiv.org/pdf/1603.05027.pdf"

# 13. A Simple Neural Network Module for Relational Reasoning (Santoro et al., 2017)
download_paper "13" "simple-nn-module-relational-reasoning" "https://arxiv.org/pdf/1706.01427.pdf"

# 14. Variational Lossy Autoencoder (Chen et al., 2017)
download_paper "14" "variational-lossy-autoencoder" "https://arxiv.org/pdf/1611.02731.pdf"

# 15. Relational Recurrent Neural Networks (Santoro et al., 2018)
download_paper "15" "relational-recurrent-neural-networks" "https://arxiv.org/pdf/1806.01822.pdf"

# 16. Neural Turing Machines (Graves et al., 2014)
download_paper "16" "neural-turing-machines" "https://arxiv.org/pdf/1410.5401.pdf"

# 17. Deep Speech 2: End-to-End Speech Recognition (Amodei et al., 2015)
download_paper "17" "deep-speech-2" "https://arxiv.org/pdf/1512.02595.pdf"

# 18. Scaling Laws for Neural Language Models (Kaplan et al., 2020)
download_paper "18" "scaling-laws-neural-language-models" "https://arxiv.org/pdf/2001.08361.pdf"

# 19. A Tutorial Introduction to MDL Principle (Grunwald, 2004)
download_paper "19" "tutorial-introduction-minimum-description-length" "https://arxiv.org/pdf/math/0406077.pdf"

# 20. Grokking: Generalization Beyond Overfitting (Power et al., 2022)
download_paper "20" "grokking-generalization-beyond-overfitting" "https://arxiv.org/pdf/2201.02177.pdf"

# 21. A Neural Probabilistic Language Model (Bengio et al., 2003)
download_paper "21" "neural-probabilistic-language-model" "https://www.jmlr.org/papers/volume3/bengio03a/bengio03a.pdf"

# 22. Reward Modeling for Mitigating Overoptimization in RLHF (Gao et al., 2022)
download_paper "22" "reward-modeling-overoptimization-rlhf" "https://arxiv.org/pdf/2210.10760.pdf"

# 23. Machine Super Intelligence (Shane Legg, 2008) - dissertation
download_paper "23" "machine-super-intelligence" "https://www.vetta.org/documents/Machine_Super_Intelligence.pdf"

# 24. CS231n notes / Deep Learning (Goodfellow et al.) 
# Note: CS231n notes are HTML, use the deep learning book instead
download_paper "24" "deep-learning-book-goodfellow" "https://www.deeplearningbook.org/contents/intro.html"

# 25. The First Law of Complexodynamics (Aaronson, 2011) - blog post, no PDF
# 26. The Unreasonable Effectiveness of RNNs (Karpathy, 2015) - blog post, no PDF  
# 27. Understanding LSTM Networks (Olah, 2015) - blog post, no PDF
# 28. The Annotated Transformer (Rush, 2018) - tutorial, no PDF

# 25. Quantifying Rise and Fall of Complexity / Coffee Automaton (Aaronson et al., 2014)
download_paper "25" "coffee-automaton-complexity" "https://arxiv.org/pdf/1405.6903.pdf"

# 26. ConvNet for Large-Scale Image Recognition - VGGNet (Simonyan & Zisserman, 2015)
download_paper "26" "very-deep-convolutional-networks-vggnet" "https://arxiv.org/pdf/1409.1556.pdf"

# Additional papers from the list:

# 27. Generative Adversarial Nets (Goodfellow et al., 2014)
download_paper "27" "generative-adversarial-nets" "https://arxiv.org/pdf/1406.2661.pdf"

# 28. Adam: A Method for Stochastic Optimization (Kingma & Ba, 2015)
download_paper "28" "adam-stochastic-optimization" "https://arxiv.org/pdf/1412.6980.pdf"

# 29. Dropout: A Simple Way to Prevent Neural Networks from Overfitting (Srivastava et al., 2014)
download_paper "29" "dropout" "https://jmlr.org/papers/volume15/srivastava14a/srivastava14a.pdf"

# 30. Batch Normalization (Ioffe & Szegedy, 2015)
download_paper "30" "batch-normalization" "https://arxiv.org/pdf/1502.03167.pdf"

echo ""
echo "Download complete. Checking file sizes..."
echo ""
ls -lh "$DIR"/*.pdf 2>/dev/null | awk '{print $5, $9}'

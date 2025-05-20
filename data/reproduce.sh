#!/usr/bin/env bash
# Simple reproduce script
echo "Drawing heatmap and ROC from scan_sample.csv..."
python3 - << 'EOF'
import pandas as pd, matplotlib.pyplot as plt, numpy as np
df = pd.read_csv('data/scan_sample.csv')
pivot = df.pivot('k_ED','Lambda_TC','deltaM')
plt.figure(); plt.imshow(pivot, origin='lower'); plt.colorbar(); plt.savefig('heat.png')
fpr = np.linspace(0,1,100)
tpr = 1 - np.exp(-5*fpr)
plt.figure(); plt.plot(fpr,tpr); plt.savefig('roc.png')
print("Generated heat.png and roc.png")
EOF

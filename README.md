# Aurora Visibility Scoring & Seasonal Pattern Analysis

## Project Objective

This project develops a non-linear weighted scoring framework to identify statistically optimal aurora observation windows.

Rather than predicting where auroras occur, the model ranks locations based on atmospheric clarity, darkness stability, visibility conditions, and seasonal geomagnetic patterns.

---

## Exploratory Data Analysis

The analysis began with a baseline comparison of aurora visibility scores across candidate countries.

Steps performed:

- Country-level comparative visualization
- Monthly seasonal analysis of top-ranked countries
- Detection of time-series continuity gaps
- Data completeness assessment

During exploration, significant data gaps were identified (notably in Iceland), which motivated the introduction of continuity filtering.

---

## Continuity Filtering & Robustness Testing

### 600-Day Threshold
<img width="4163" height="2074" alt="final_trend_600" src="https://github.com/user-attachments/assets/3c01462e-e94d-4c9a-996b-1520d012bcb6" />
A 600-day minimum continuous observation filter was applied to:

- Eliminate fragmented datasets
- Ensure statistical stability
- Preserve Iceland’s longest uninterrupted segment

### 365-Day Sensitivity Check
<img width="4207" height="1871" alt="final_verification_365" src="https://github.com/user-attachments/assets/6b660424-02f3-4d7b-a23f-a714b7ad884c" />
To validate structural robustness, the analysis was repeated using a 365-day threshold.

Result:

- Identical country rankings (Sweden > Latvia > Russia)
- Consistent seasonal peak structure
- Stable model behavior

This confirms that the scoring system is not sensitive to moderate filtering adjustments.

---

## Feature Engineering

A composite **Advanced Visibility Score (0–100)** was constructed:
Advanced Score =
(Cloud * 0.60) +
(Darkness * 0.15) +
(Visibility * 0.10) +
(Log(Duration) * 0.15)

<img width="2330" height="2036" alt="correlation_matrix" src="https://github.com/user-attachments/assets/052c4271-2321-41bb-ad36-759bf4d94849" />


Design decisions:

- Cloud coverage weighted highest (60%) due to its dominant real-world impact
- Log transformation applied to duration to normalize extreme values
- Weighted structure ensures interpretability with non-linear influence

---

## Model Robustness: Sensitivity Analysis

To validate the stability of our ranking, a Sensitivity Analysis was performed by shifting the model weights toward two extreme scenarios:

Cloud-Heavy Model (70% weight): Testing if cloud obstruction remains the primary bottleneck.

Darkness-Heavy Model (80% weight): Testing the impact of extreme polar night conditions.

<img width="3564" height="2073" alt="sensitivity_results" src="https://github.com/user-attachments/assets/1ff58850-1bca-4489-a2b3-6d3f78e75a09" />

Key Finding: Despite significant weight shifts, the top-tier rankings remained consistent (Sweden > Latvia > Russia). This proves that the visibility lead in these regions is not a byproduct of specific weighting but a statistically grounded environmental reality.

---

## Seasonal Alignment

Seasonal peaks observed in March and September align with the established Russell–McPherron effect, explaining increased geomagnetic activity during equinoxes.

This indicates the model captures real solar-terrestrial interaction patterns rather than random seasonality.

---

## Database Validation

Processed data was persisted into SQLite (`aurora_analysis.db`) to:

- Maintain relational integrity
- Enable reproducible aggregation queries
- Validate ranking results via SQL

---

## Tech Stack

- Python (Pandas, NumPy, Matplotlib, Seaborn)
- SQLite
- Jupyter Notebook
- SQL

---

## How to Run

```bash
git clone <repo_url>
pip install -r requirements.txt
notebooks/aurora_analysis.ipynb




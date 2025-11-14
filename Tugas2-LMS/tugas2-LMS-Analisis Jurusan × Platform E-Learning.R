# ================================================
#  DATA: Jurusan × Platform E-Learning
# ================================================

library(dplyr)
library(tidyr)
library(ggplot2)

# Membuat data frame dalam format long
data <- data.frame(
  Jurusan = c("Sistem Informasi", "Sains Data", "Statistika"),
  Zoom = c(10, 8, 5),
  GoogleMeet = c(20, 12, 10),
  LMSKampus = c(10, 10, 5)
)

# Ubah menjadi long format
data_long <- data %>%
  pivot_longer(cols = -Jurusan,
               names_to = "Platform",
               values_to = "Jumlah")

print("=== Data Long ===")
print(data_long)


# ================================================
# 1. Tabel Kontingensi
# ================================================
tabel_kontingensi <- xtabs(Jumlah ~ Jurusan + Platform, data = data_long)
print("=== Tabel Kontingensi ===")
print(tabel_kontingensi)


# ================================================
# 2. Proporsi Gabungan (Joint Proportion)
# ================================================
prop_joint <- prop.table(tabel_kontingensi)
print("=== Proporsi Gabungan ===")
print(prop_joint)


# ================================================
# 3. Proporsi Marginal Platform
# ================================================
prop_marginal_platform <- prop.table(colSums(tabel_kontingensi))
print("=== Proporsi Marginal Platform ===")
print(prop_marginal_platform)


# ================================================
# 4. Proporsi Bersyarat per Jurusan
# ================================================
prop_per_jurusan <- prop.table(tabel_kontingensi, 1)
print("=== Proporsi Bersyarat per Jurusan ===")
print(prop_per_jurusan)


# ================================================
# 5. Grafik 100% Stacked Bar (ggplot2)
# ================================================
ggplot(data_long, aes(x = Jurusan, y = Jumlah, fill = Platform)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Distribusi Platform E-Learning per Jurusan (100% Stacked Bar)",
       y = "Proporsi",
       x = "Jurusan") +
  theme_minimal()


# ================================================
# 6. Kesimpulan
# ================================================
cat("\n=== KESIMPULAN ===\n")

platform_dominan <- names(which.max(prop_marginal_platform))

cat("1. Platform paling dominan secara keseluruhan adalah:", platform_dominan, "\n")
cat("2. Proporsi gabungan, marginal, dan bersyarat telah dicetak di atas.\n")
cat("3. Grafik menampilkan preferensi platform untuk setiap jurusan.\n")

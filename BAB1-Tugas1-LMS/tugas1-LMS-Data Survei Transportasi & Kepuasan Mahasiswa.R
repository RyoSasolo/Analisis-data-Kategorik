# -----------------------------------------------
# Data Survei Transportasi & Kepuasan Mahasiswa
# -----------------------------------------------

# 1. Memasukkan data ke dalam data.frame
ID <- 1:12
Transportasi <- c("Motor","Mobil","Motor","Jalan Kaki","Sepeda","Motor",
                  "Mobil","Motor","Jalan Kaki","Motor","Sepeda","Mobil")
Kepuasan <- c("Puas","Sangat Puas","Cukup","Tidak Puas","Puas","Sangat Puas",
              "Puas","Cukup","Cukup","Puas","Tidak Puas","Puas")

data <- data.frame(ID, Transportasi, Kepuasan)

# Tampilkan data
print("=== Data Survei ===")
print(data)


# -----------------------------------------------
# 2. Tabel Frekuensi Transportasi
# -----------------------------------------------
transport_freq <- table(data$Transportasi)
print("=== Tabel Frekuensi Transportasi ===")
print(transport_freq)


# -----------------------------------------------
# 3. Tabel Proporsi Kepuasan
# -----------------------------------------------
kepuasan_prop <- prop.table(table(data$Kepuasan))
print("=== Proporsi Kepuasan ===")
print(kepuasan_prop)


# -----------------------------------------------
# 4. Tabel Silang Transportasi * Kepuasan
# -----------------------------------------------
xtab <- table(data$Transportasi, data$Kepuasan)
print("=== Tabel Silang Transportasi x Kepuasan ===")
print(xtab)


# -----------------------------------------------
# 5. Visualisasi Distribusi Transportasi
# -----------------------------------------------
barplot(transport_freq,
        main = "Distribusi Moda Transportasi Mahasiswa",
        xlab = "Moda Transportasi",
        ylab = "Frekuensi",
        col = "skyblue")

# -----------------------------------------------
# 6. Visualisasi Distribusi Kepuasan
# -----------------------------------------------
barplot(table(data$Kepuasan),
        main = "Distribusi Tingkat Kepuasan Mahasiswa",
        xlab = "Tingkat Kepuasan",
        ylab = "Frekuensi",
        col = "lightgreen")


# -----------------------------------------------
# 7. Kesimpulan (disampaikan dalam output tertulis)
# -----------------------------------------------
cat("\n=== KESIMPULAN ===\n")
cat("1. Moda transportasi paling dominan: ",
    names(which.max(transport_freq)), "\n")
cat("2. Distribusi kepuasan dapat dilihat pada proporsi yang dicetak di atas.\n")
cat("3. Tabel silang menunjukkan kecenderungan tertentu antara moda transportasi dan tingkat kepuasan.\n")

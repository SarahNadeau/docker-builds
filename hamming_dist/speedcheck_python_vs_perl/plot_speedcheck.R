require(ggplot2)

speeds <- read.csv(file = "hamming_dist/speedcheck_python_vs_perl/speedcheck.txt")
colnames(speeds)[colnames(speeds) == "M"] <- "SEQ_LENGTH"

p <- ggplot(
  data = speeds,
  aes(x = N, shape = factor(EST_FREQ))) +
  geom_point(aes(y = runtime_pl, color = "Perl")) +
  geom_point(aes(y = runtime_py, color = "Python")) +
  facet_grid(SEQ_LENGTH ~ N_CPU, scales = "free", labeller = label_both) +
  labs(x = "Number of sequences", y = "Runtime (sec)") +
  scale_color_discrete(name = "Implementation") +
  scale_shape_discrete(name = "Estimation")

ggsave(
  filename = "hamming_dist/speedcheck_python_vs_perl/speedcheck.png",
  plot = p,
  width = 7,
  height = 4
)
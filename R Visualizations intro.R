install.packages("ggplot2")
install.packages("palmerpenguins")

library(ggplot2)
library(palmerpenguins)
data(penguins)
View(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species))

ggplot(data = penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape=species))

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species, size = species, shape=species))

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha=species), color="purple")


ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins) + geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))



ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut, fill=clarity))

#facets practice
ggplot(data=penguins,aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) +
  facet_wrap(~species)

ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=color, fill=cut)) +
  facet_wrap(~cut)

ggplot(data=penguins,aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) +
  facet_grid(~sex)

#labels and annotations
ggplot(data=penguins,aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length")
  
  
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species)) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length")

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species)) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguins Species", caption = "Data collected by Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold",size=4.5, angle=25)

  
#annotation

annotate("text", x=220, y=3500, label="The Gentoos are the largest")

p <- ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species)) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguins Species", caption = "Data collected by Dr. Kristen Gorman")
p + annotate("text", x=220, y=3500, label="The Gentoos are the largest")

#saving the plot

ggsave("Three Penguin Species.jpeg")
 
<script setup>
import { computed } from 'vue'
import { useNav } from '@slidev/client'

const { currentSlideNo, currentSlideRoute, slides } = useNav()

const mainSlides = computed(() =>
  slides.value.filter(s => !s.meta?.slide?.frontmatter?.class?.includes('supplementary'))
)

const isSupplementary = computed(() =>
  currentSlideRoute.value?.meta?.slide?.frontmatter?.class?.includes('supplementary')
)

const mainIndex = computed(() =>
  mainSlides.value.findIndex(s => s.no === currentSlideNo.value) + 1
)

const r = 22
const circumference = 2 * Math.PI * r
const dashOffset = computed(() => {
  const total = mainSlides.value.length
  const current = mainIndex.value
  if (total === 0) return circumference
  return circumference * (1 - current / total)
})
</script>

<template>
  <div v-if="!isSupplementary" class="progress-ring-container">
    <svg width="42" height="42" viewBox="0 0 56 56">
      <circle
        cx="28" cy="28" :r="r"
        fill="none"
        stroke="rgba(255,255,255,0.15)"
        stroke-width="3"
      />
      <circle
        cx="28" cy="28" :r="r"
        fill="none"
        stroke="#6495ED"
        stroke-width="3"
        stroke-linecap="round"
        :stroke-dasharray="circumference"
        :stroke-dashoffset="dashOffset"
        transform="rotate(-90 28 28)"
        style="transition: stroke-dashoffset 0.4s ease"
      />
      <text
        x="28" y="28"
        text-anchor="middle"
        dominant-baseline="central"
        fill="#CCCCCC"
        font-size="5"
        font-weight="600"
      >{{ mainIndex }}</text>
    </svg>
  </div>
</template>

<style scoped>
.progress-ring-container {
  position: fixed;
  bottom: 8px;
  right: 8px;
  width: 42px;
  height: 42px;
  pointer-events: none;
  z-index: 100;
}
</style>

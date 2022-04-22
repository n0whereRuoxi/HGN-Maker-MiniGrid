( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b606 - block
    b977 - block
    b638 - block
    b779 - block
    b385 - block
    b423 - block
    b367 - block
    b377 - block
    b114 - block
    b848 - block
    b713 - block
    b7 - block
    b582 - block
    b702 - block
    b622 - block
    b841 - block
    b217 - block
    b159 - block
    b29 - block
    b15 - block
    b620 - block
    b34 - block
    b956 - block
    b597 - block
    b363 - block
    b396 - block
    b868 - block
    b894 - block
    b133 - block
    b596 - block
    b834 - block
    b286 - block
    b235 - block
    b417 - block
    b528 - block
    b778 - block
    b399 - block
    b807 - block
    b922 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b606 )
    ( on b977 b606 )
    ( on b638 b977 )
    ( on b779 b638 )
    ( on b385 b779 )
    ( on b423 b385 )
    ( on b367 b423 )
    ( on b377 b367 )
    ( on b114 b377 )
    ( on b848 b114 )
    ( on b713 b848 )
    ( on b7 b713 )
    ( on b582 b7 )
    ( on b702 b582 )
    ( on b622 b702 )
    ( on b841 b622 )
    ( on b217 b841 )
    ( on b159 b217 )
    ( on b29 b159 )
    ( on b15 b29 )
    ( on b620 b15 )
    ( on b34 b620 )
    ( on b956 b34 )
    ( on b597 b956 )
    ( on b363 b597 )
    ( on b396 b363 )
    ( on b868 b396 )
    ( on b894 b868 )
    ( on b133 b894 )
    ( on b596 b133 )
    ( on b834 b596 )
    ( on b286 b834 )
    ( on b235 b286 )
    ( on b417 b235 )
    ( on b528 b417 )
    ( on b778 b528 )
    ( on b399 b778 )
    ( on b807 b399 )
    ( on b922 b807 )
    ( on b457 b922 )
    ( clear b457 )
  )
  ( :goal
    ( and
      ( clear b606 )
    )
  )
)

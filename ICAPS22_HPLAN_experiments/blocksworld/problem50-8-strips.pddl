( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b922 - block
    b151 - block
    b691 - block
    b261 - block
    b758 - block
    b903 - block
    b140 - block
    b841 - block
    b298 - block
    b114 - block
    b492 - block
    b11 - block
    b583 - block
    b192 - block
    b570 - block
    b169 - block
    b150 - block
    b348 - block
    b472 - block
    b301 - block
    b95 - block
    b878 - block
    b490 - block
    b521 - block
    b719 - block
    b635 - block
    b357 - block
    b908 - block
    b613 - block
    b441 - block
    b428 - block
    b967 - block
    b442 - block
    b971 - block
    b563 - block
    b720 - block
    b604 - block
    b459 - block
    b644 - block
    b373 - block
    b240 - block
    b532 - block
    b743 - block
    b369 - block
    b627 - block
    b86 - block
    b339 - block
    b74 - block
    b751 - block
    b515 - block
    b12 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b922 )
    ( on b151 b922 )
    ( on b691 b151 )
    ( on b261 b691 )
    ( on b758 b261 )
    ( on b903 b758 )
    ( on b140 b903 )
    ( on b841 b140 )
    ( on b298 b841 )
    ( on b114 b298 )
    ( on b492 b114 )
    ( on b11 b492 )
    ( on b583 b11 )
    ( on b192 b583 )
    ( on b570 b192 )
    ( on b169 b570 )
    ( on b150 b169 )
    ( on b348 b150 )
    ( on b472 b348 )
    ( on b301 b472 )
    ( on b95 b301 )
    ( on b878 b95 )
    ( on b490 b878 )
    ( on b521 b490 )
    ( on b719 b521 )
    ( on b635 b719 )
    ( on b357 b635 )
    ( on b908 b357 )
    ( on b613 b908 )
    ( on b441 b613 )
    ( on b428 b441 )
    ( on b967 b428 )
    ( on b442 b967 )
    ( on b971 b442 )
    ( on b563 b971 )
    ( on b720 b563 )
    ( on b604 b720 )
    ( on b459 b604 )
    ( on b644 b459 )
    ( on b373 b644 )
    ( on b240 b373 )
    ( on b532 b240 )
    ( on b743 b532 )
    ( on b369 b743 )
    ( on b627 b369 )
    ( on b86 b627 )
    ( on b339 b86 )
    ( on b74 b339 )
    ( on b751 b74 )
    ( on b515 b751 )
    ( on b12 b515 )
    ( clear b12 )
  )
  ( :goal
    ( and
      ( clear b922 )
    )
  )
)

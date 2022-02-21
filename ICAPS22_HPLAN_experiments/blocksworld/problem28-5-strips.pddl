( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b739 - block
    b930 - block
    b166 - block
    b540 - block
    b153 - block
    b261 - block
    b140 - block
    b211 - block
    b184 - block
    b660 - block
    b167 - block
    b931 - block
    b283 - block
    b14 - block
    b235 - block
    b358 - block
    b839 - block
    b120 - block
    b703 - block
    b226 - block
    b248 - block
    b354 - block
    b29 - block
    b815 - block
    b461 - block
    b287 - block
    b587 - block
    b143 - block
    b898 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b739 )
    ( on b930 b739 )
    ( on b166 b930 )
    ( on b540 b166 )
    ( on b153 b540 )
    ( on b261 b153 )
    ( on b140 b261 )
    ( on b211 b140 )
    ( on b184 b211 )
    ( on b660 b184 )
    ( on b167 b660 )
    ( on b931 b167 )
    ( on b283 b931 )
    ( on b14 b283 )
    ( on b235 b14 )
    ( on b358 b235 )
    ( on b839 b358 )
    ( on b120 b839 )
    ( on b703 b120 )
    ( on b226 b703 )
    ( on b248 b226 )
    ( on b354 b248 )
    ( on b29 b354 )
    ( on b815 b29 )
    ( on b461 b815 )
    ( on b287 b461 )
    ( on b587 b287 )
    ( on b143 b587 )
    ( on b898 b143 )
    ( clear b898 )
  )
  ( :goal
    ( and
      ( clear b739 )
    )
  )
)

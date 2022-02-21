( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b157 - block
    b930 - block
    b606 - block
    b172 - block
    b713 - block
    b844 - block
    b32 - block
    b733 - block
    b203 - block
    b544 - block
    b451 - block
    b235 - block
    b421 - block
    b542 - block
    b823 - block
    b443 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b157 )
    ( on b930 b157 )
    ( on b606 b930 )
    ( on b172 b606 )
    ( on b713 b172 )
    ( on b844 b713 )
    ( on b32 b844 )
    ( on b733 b32 )
    ( on b203 b733 )
    ( on b544 b203 )
    ( on b451 b544 )
    ( on b235 b451 )
    ( on b421 b235 )
    ( on b542 b421 )
    ( on b823 b542 )
    ( on b443 b823 )
    ( clear b443 )
  )
  ( :goal
    ( and
      ( clear b157 )
    )
  )
)

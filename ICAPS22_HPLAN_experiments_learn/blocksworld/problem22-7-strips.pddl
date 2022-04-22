( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b950 - block
    b846 - block
    b568 - block
    b912 - block
    b727 - block
    b677 - block
    b827 - block
    b155 - block
    b676 - block
    b41 - block
    b223 - block
    b211 - block
    b664 - block
    b363 - block
    b278 - block
    b969 - block
    b235 - block
    b595 - block
    b758 - block
    b397 - block
    b503 - block
    b762 - block
    b520 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b846 b950 )
    ( on b568 b846 )
    ( on b912 b568 )
    ( on b727 b912 )
    ( on b677 b727 )
    ( on b827 b677 )
    ( on b155 b827 )
    ( on b676 b155 )
    ( on b41 b676 )
    ( on b223 b41 )
    ( on b211 b223 )
    ( on b664 b211 )
    ( on b363 b664 )
    ( on b278 b363 )
    ( on b969 b278 )
    ( on b235 b969 )
    ( on b595 b235 )
    ( on b758 b595 )
    ( on b397 b758 )
    ( on b503 b397 )
    ( on b762 b503 )
    ( on b520 b762 )
    ( clear b520 )
  )
  ( :goal
    ( and
      ( clear b950 )
    )
  )
)

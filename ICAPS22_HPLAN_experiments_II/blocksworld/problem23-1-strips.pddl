( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b719 - block
    b364 - block
    b81 - block
    b543 - block
    b761 - block
    b680 - block
    b369 - block
    b479 - block
    b563 - block
    b879 - block
    b421 - block
    b278 - block
    b701 - block
    b302 - block
    b799 - block
    b235 - block
    b395 - block
    b32 - block
    b38 - block
    b985 - block
    b319 - block
    b425 - block
    b575 - block
    b972 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b719 )
    ( on b364 b719 )
    ( on b81 b364 )
    ( on b543 b81 )
    ( on b761 b543 )
    ( on b680 b761 )
    ( on b369 b680 )
    ( on b479 b369 )
    ( on b563 b479 )
    ( on b879 b563 )
    ( on b421 b879 )
    ( on b278 b421 )
    ( on b701 b278 )
    ( on b302 b701 )
    ( on b799 b302 )
    ( on b235 b799 )
    ( on b395 b235 )
    ( on b32 b395 )
    ( on b38 b32 )
    ( on b985 b38 )
    ( on b319 b985 )
    ( on b425 b319 )
    ( on b575 b425 )
    ( on b972 b575 )
    ( clear b972 )
  )
  ( :goal
    ( and
      ( clear b719 )
    )
  )
)

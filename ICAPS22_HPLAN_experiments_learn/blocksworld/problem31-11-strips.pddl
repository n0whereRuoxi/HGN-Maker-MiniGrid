( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b863 - block
    b673 - block
    b563 - block
    b273 - block
    b291 - block
    b368 - block
    b232 - block
    b784 - block
    b740 - block
    b174 - block
    b35 - block
    b169 - block
    b186 - block
    b209 - block
    b686 - block
    b308 - block
    b800 - block
    b330 - block
    b351 - block
    b928 - block
    b207 - block
    b749 - block
    b615 - block
    b331 - block
    b132 - block
    b388 - block
    b105 - block
    b213 - block
    b369 - block
    b872 - block
    b930 - block
    b668 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b863 )
    ( on b673 b863 )
    ( on b563 b673 )
    ( on b273 b563 )
    ( on b291 b273 )
    ( on b368 b291 )
    ( on b232 b368 )
    ( on b784 b232 )
    ( on b740 b784 )
    ( on b174 b740 )
    ( on b35 b174 )
    ( on b169 b35 )
    ( on b186 b169 )
    ( on b209 b186 )
    ( on b686 b209 )
    ( on b308 b686 )
    ( on b800 b308 )
    ( on b330 b800 )
    ( on b351 b330 )
    ( on b928 b351 )
    ( on b207 b928 )
    ( on b749 b207 )
    ( on b615 b749 )
    ( on b331 b615 )
    ( on b132 b331 )
    ( on b388 b132 )
    ( on b105 b388 )
    ( on b213 b105 )
    ( on b369 b213 )
    ( on b872 b369 )
    ( on b930 b872 )
    ( on b668 b930 )
    ( clear b668 )
  )
  ( :goal
    ( and
      ( clear b863 )
    )
  )
)

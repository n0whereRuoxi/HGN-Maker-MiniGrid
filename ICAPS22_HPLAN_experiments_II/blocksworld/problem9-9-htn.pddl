( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b802 - block
    b46 - block
    b824 - block
    b821 - block
    b413 - block
    b170 - block
    b140 - block
    b803 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b802 b891 )
    ( on b46 b802 )
    ( on b824 b46 )
    ( on b821 b824 )
    ( on b413 b821 )
    ( on b170 b413 )
    ( on b140 b170 )
    ( on b803 b140 )
    ( on b231 b803 )
    ( clear b231 )
  )
  ( :tasks
    ( Make-9Pile b802 b46 b824 b821 b413 b170 b140 b803 b231 )
  )
)

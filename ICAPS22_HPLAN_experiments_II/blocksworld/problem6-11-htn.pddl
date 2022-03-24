( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b911 - block
    b63 - block
    b68 - block
    b941 - block
    b763 - block
    b207 - block
    b994 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b911 )
    ( on b63 b911 )
    ( on b68 b63 )
    ( on b941 b68 )
    ( on b763 b941 )
    ( on b207 b763 )
    ( on b994 b207 )
    ( clear b994 )
  )
  ( :tasks
    ( Make-6Pile b63 b68 b941 b763 b207 b994 )
  )
)

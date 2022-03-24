( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b722 - block
    b294 - block
    b51 - block
    b439 - block
    b882 - block
    b772 - block
    b394 - block
    b852 - block
    b831 - block
    b210 - block
    b596 - block
    b990 - block
    b649 - block
    b32 - block
    b653 - block
    b986 - block
    b815 - block
    b11 - block
    b931 - block
    b369 - block
    b769 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b722 )
    ( on b294 b722 )
    ( on b51 b294 )
    ( on b439 b51 )
    ( on b882 b439 )
    ( on b772 b882 )
    ( on b394 b772 )
    ( on b852 b394 )
    ( on b831 b852 )
    ( on b210 b831 )
    ( on b596 b210 )
    ( on b990 b596 )
    ( on b649 b990 )
    ( on b32 b649 )
    ( on b653 b32 )
    ( on b986 b653 )
    ( on b815 b986 )
    ( on b11 b815 )
    ( on b931 b11 )
    ( on b369 b931 )
    ( on b769 b369 )
    ( on b780 b769 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b722 )
    )
  )
)

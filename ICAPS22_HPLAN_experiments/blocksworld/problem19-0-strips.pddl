( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b716 - block
    b100 - block
    b792 - block
    b138 - block
    b352 - block
    b24 - block
    b511 - block
    b369 - block
    b487 - block
    b819 - block
    b371 - block
    b960 - block
    b844 - block
    b634 - block
    b436 - block
    b281 - block
    b746 - block
    b466 - block
    b724 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b716 )
    ( on b100 b716 )
    ( on b792 b100 )
    ( on b138 b792 )
    ( on b352 b138 )
    ( on b24 b352 )
    ( on b511 b24 )
    ( on b369 b511 )
    ( on b487 b369 )
    ( on b819 b487 )
    ( on b371 b819 )
    ( on b960 b371 )
    ( on b844 b960 )
    ( on b634 b844 )
    ( on b436 b634 )
    ( on b281 b436 )
    ( on b746 b281 )
    ( on b466 b746 )
    ( on b724 b466 )
    ( on b309 b724 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b716 )
    )
  )
)

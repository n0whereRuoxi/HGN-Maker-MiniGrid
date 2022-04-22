( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b263 - block
    b537 - block
    b656 - block
    b81 - block
    b190 - block
    b590 - block
    b621 - block
    b147 - block
    b734 - block
    b405 - block
    b824 - block
    b518 - block
    b496 - block
    b585 - block
    b598 - block
    b20 - block
    b92 - block
    b394 - block
    b693 - block
    b32 - block
    b113 - block
    b136 - block
    b859 - block
    b287 - block
    b605 - block
    b417 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b263 )
    ( on b537 b263 )
    ( on b656 b537 )
    ( on b81 b656 )
    ( on b190 b81 )
    ( on b590 b190 )
    ( on b621 b590 )
    ( on b147 b621 )
    ( on b734 b147 )
    ( on b405 b734 )
    ( on b824 b405 )
    ( on b518 b824 )
    ( on b496 b518 )
    ( on b585 b496 )
    ( on b598 b585 )
    ( on b20 b598 )
    ( on b92 b20 )
    ( on b394 b92 )
    ( on b693 b394 )
    ( on b32 b693 )
    ( on b113 b32 )
    ( on b136 b113 )
    ( on b859 b136 )
    ( on b287 b859 )
    ( on b605 b287 )
    ( on b417 b605 )
    ( clear b417 )
  )
  ( :goal
    ( and
      ( clear b263 )
    )
  )
)

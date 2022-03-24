( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b898 - block
    b279 - block
    b468 - block
    b708 - block
    b264 - block
    b151 - block
    b803 - block
    b506 - block
    b504 - block
    b13 - block
    b617 - block
    b951 - block
    b473 - block
    b991 - block
    b98 - block
    b384 - block
    b290 - block
    b169 - block
    b596 - block
    b838 - block
    b297 - block
    b618 - block
    b222 - block
    b382 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b898 )
    ( on b279 b898 )
    ( on b468 b279 )
    ( on b708 b468 )
    ( on b264 b708 )
    ( on b151 b264 )
    ( on b803 b151 )
    ( on b506 b803 )
    ( on b504 b506 )
    ( on b13 b504 )
    ( on b617 b13 )
    ( on b951 b617 )
    ( on b473 b951 )
    ( on b991 b473 )
    ( on b98 b991 )
    ( on b384 b98 )
    ( on b290 b384 )
    ( on b169 b290 )
    ( on b596 b169 )
    ( on b838 b596 )
    ( on b297 b838 )
    ( on b618 b297 )
    ( on b222 b618 )
    ( on b382 b222 )
    ( clear b382 )
  )
  ( :goal
    ( and
      ( clear b898 )
    )
  )
)

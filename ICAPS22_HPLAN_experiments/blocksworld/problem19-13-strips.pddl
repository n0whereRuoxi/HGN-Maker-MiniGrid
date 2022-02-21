( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b431 - block
    b80 - block
    b212 - block
    b301 - block
    b264 - block
    b507 - block
    b468 - block
    b432 - block
    b623 - block
    b651 - block
    b558 - block
    b256 - block
    b506 - block
    b502 - block
    b968 - block
    b245 - block
    b980 - block
    b616 - block
    b108 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b431 b764 )
    ( on b80 b431 )
    ( on b212 b80 )
    ( on b301 b212 )
    ( on b264 b301 )
    ( on b507 b264 )
    ( on b468 b507 )
    ( on b432 b468 )
    ( on b623 b432 )
    ( on b651 b623 )
    ( on b558 b651 )
    ( on b256 b558 )
    ( on b506 b256 )
    ( on b502 b506 )
    ( on b968 b502 )
    ( on b245 b968 )
    ( on b980 b245 )
    ( on b616 b980 )
    ( on b108 b616 )
    ( clear b108 )
  )
  ( :goal
    ( and
      ( clear b764 )
    )
  )
)

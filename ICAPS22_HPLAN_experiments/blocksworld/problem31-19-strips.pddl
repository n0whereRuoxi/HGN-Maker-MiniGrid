( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b726 - block
    b372 - block
    b839 - block
    b1 - block
    b283 - block
    b225 - block
    b474 - block
    b15 - block
    b983 - block
    b60 - block
    b490 - block
    b664 - block
    b779 - block
    b547 - block
    b146 - block
    b18 - block
    b167 - block
    b206 - block
    b201 - block
    b506 - block
    b731 - block
    b709 - block
    b310 - block
    b424 - block
    b103 - block
    b624 - block
    b748 - block
    b320 - block
    b639 - block
    b143 - block
    b131 - block
    b953 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b726 )
    ( on b372 b726 )
    ( on b839 b372 )
    ( on b1 b839 )
    ( on b283 b1 )
    ( on b225 b283 )
    ( on b474 b225 )
    ( on b15 b474 )
    ( on b983 b15 )
    ( on b60 b983 )
    ( on b490 b60 )
    ( on b664 b490 )
    ( on b779 b664 )
    ( on b547 b779 )
    ( on b146 b547 )
    ( on b18 b146 )
    ( on b167 b18 )
    ( on b206 b167 )
    ( on b201 b206 )
    ( on b506 b201 )
    ( on b731 b506 )
    ( on b709 b731 )
    ( on b310 b709 )
    ( on b424 b310 )
    ( on b103 b424 )
    ( on b624 b103 )
    ( on b748 b624 )
    ( on b320 b748 )
    ( on b639 b320 )
    ( on b143 b639 )
    ( on b131 b143 )
    ( on b953 b131 )
    ( clear b953 )
  )
  ( :goal
    ( and
      ( clear b726 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b316 - block
    b998 - block
    b502 - block
    b670 - block
    b268 - block
    b666 - block
    b495 - block
    b153 - block
    b961 - block
    b430 - block
    b530 - block
    b460 - block
    b475 - block
    b539 - block
    b438 - block
    b727 - block
    b157 - block
    b39 - block
    b586 - block
    b419 - block
    b557 - block
    b946 - block
    b116 - block
    b471 - block
    b736 - block
    b569 - block
    b755 - block
    b935 - block
    b992 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b316 )
    ( on b998 b316 )
    ( on b502 b998 )
    ( on b670 b502 )
    ( on b268 b670 )
    ( on b666 b268 )
    ( on b495 b666 )
    ( on b153 b495 )
    ( on b961 b153 )
    ( on b430 b961 )
    ( on b530 b430 )
    ( on b460 b530 )
    ( on b475 b460 )
    ( on b539 b475 )
    ( on b438 b539 )
    ( on b727 b438 )
    ( on b157 b727 )
    ( on b39 b157 )
    ( on b586 b39 )
    ( on b419 b586 )
    ( on b557 b419 )
    ( on b946 b557 )
    ( on b116 b946 )
    ( on b471 b116 )
    ( on b736 b471 )
    ( on b569 b736 )
    ( on b755 b569 )
    ( on b935 b755 )
    ( on b992 b935 )
    ( on b98 b992 )
    ( clear b98 )
  )
  ( :goal
    ( and
      ( clear b316 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b420 - block
    b459 - block
    b682 - block
    b551 - block
    b995 - block
    b187 - block
    b445 - block
    b993 - block
    b28 - block
    b392 - block
    b782 - block
    b698 - block
    b223 - block
    b589 - block
    b788 - block
    b706 - block
    b269 - block
    b236 - block
    b506 - block
    b758 - block
    b244 - block
    b147 - block
    b619 - block
    b167 - block
    b110 - block
    b752 - block
    b279 - block
    b732 - block
    b412 - block
    b671 - block
    b525 - block
    b656 - block
    b800 - block
    b448 - block
    b744 - block
    b491 - block
    b152 - block
    b257 - block
    b577 - block
    b836 - block
    b44 - block
    b498 - block
    b193 - block
    b432 - block
    b267 - block
    b720 - block
    b56 - block
    b502 - block
    b151 - block
    b483 - block
    b938 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b420 b64 )
    ( on b459 b420 )
    ( on b682 b459 )
    ( on b551 b682 )
    ( on b995 b551 )
    ( on b187 b995 )
    ( on b445 b187 )
    ( on b993 b445 )
    ( on b28 b993 )
    ( on b392 b28 )
    ( on b782 b392 )
    ( on b698 b782 )
    ( on b223 b698 )
    ( on b589 b223 )
    ( on b788 b589 )
    ( on b706 b788 )
    ( on b269 b706 )
    ( on b236 b269 )
    ( on b506 b236 )
    ( on b758 b506 )
    ( on b244 b758 )
    ( on b147 b244 )
    ( on b619 b147 )
    ( on b167 b619 )
    ( on b110 b167 )
    ( on b752 b110 )
    ( on b279 b752 )
    ( on b732 b279 )
    ( on b412 b732 )
    ( on b671 b412 )
    ( on b525 b671 )
    ( on b656 b525 )
    ( on b800 b656 )
    ( on b448 b800 )
    ( on b744 b448 )
    ( on b491 b744 )
    ( on b152 b491 )
    ( on b257 b152 )
    ( on b577 b257 )
    ( on b836 b577 )
    ( on b44 b836 )
    ( on b498 b44 )
    ( on b193 b498 )
    ( on b432 b193 )
    ( on b267 b432 )
    ( on b720 b267 )
    ( on b56 b720 )
    ( on b502 b56 )
    ( on b151 b502 )
    ( on b483 b151 )
    ( on b938 b483 )
    ( clear b938 )
  )
  ( :goal
    ( and
      ( clear b64 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b176 - block
    b893 - block
    b492 - block
    b808 - block
    b595 - block
    b948 - block
    b774 - block
    b779 - block
    b992 - block
    b495 - block
    b930 - block
    b478 - block
    b858 - block
    b299 - block
    b327 - block
    b775 - block
    b576 - block
    b302 - block
    b951 - block
    b618 - block
    b343 - block
    b391 - block
    b246 - block
    b326 - block
    b160 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b176 )
    ( on b893 b176 )
    ( on b492 b893 )
    ( on b808 b492 )
    ( on b595 b808 )
    ( on b948 b595 )
    ( on b774 b948 )
    ( on b779 b774 )
    ( on b992 b779 )
    ( on b495 b992 )
    ( on b930 b495 )
    ( on b478 b930 )
    ( on b858 b478 )
    ( on b299 b858 )
    ( on b327 b299 )
    ( on b775 b327 )
    ( on b576 b775 )
    ( on b302 b576 )
    ( on b951 b302 )
    ( on b618 b951 )
    ( on b343 b618 )
    ( on b391 b343 )
    ( on b246 b391 )
    ( on b326 b246 )
    ( on b160 b326 )
    ( clear b160 )
  )
  ( :goal
    ( and
      ( clear b176 )
    )
  )
)

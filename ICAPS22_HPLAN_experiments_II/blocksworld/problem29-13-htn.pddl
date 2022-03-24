( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b781 - block
    b594 - block
    b215 - block
    b756 - block
    b627 - block
    b187 - block
    b940 - block
    b300 - block
    b471 - block
    b762 - block
    b294 - block
    b172 - block
    b182 - block
    b837 - block
    b365 - block
    b219 - block
    b655 - block
    b934 - block
    b942 - block
    b807 - block
    b912 - block
    b617 - block
    b152 - block
    b149 - block
    b171 - block
    b540 - block
    b970 - block
    b943 - block
    b683 - block
    b469 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b781 )
    ( on b594 b781 )
    ( on b215 b594 )
    ( on b756 b215 )
    ( on b627 b756 )
    ( on b187 b627 )
    ( on b940 b187 )
    ( on b300 b940 )
    ( on b471 b300 )
    ( on b762 b471 )
    ( on b294 b762 )
    ( on b172 b294 )
    ( on b182 b172 )
    ( on b837 b182 )
    ( on b365 b837 )
    ( on b219 b365 )
    ( on b655 b219 )
    ( on b934 b655 )
    ( on b942 b934 )
    ( on b807 b942 )
    ( on b912 b807 )
    ( on b617 b912 )
    ( on b152 b617 )
    ( on b149 b152 )
    ( on b171 b149 )
    ( on b540 b171 )
    ( on b970 b540 )
    ( on b943 b970 )
    ( on b683 b943 )
    ( on b469 b683 )
    ( clear b469 )
  )
  ( :tasks
    ( Make-29Pile b594 b215 b756 b627 b187 b940 b300 b471 b762 b294 b172 b182 b837 b365 b219 b655 b934 b942 b807 b912 b617 b152 b149 b171 b540 b970 b943 b683 b469 )
  )
)

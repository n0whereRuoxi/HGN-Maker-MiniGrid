( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b161 - block
    b177 - block
    b728 - block
    b22 - block
    b201 - block
    b936 - block
    b671 - block
    b870 - block
    b390 - block
    b743 - block
    b971 - block
    b229 - block
    b416 - block
    b892 - block
    b960 - block
    b205 - block
    b764 - block
    b347 - block
    b35 - block
    b311 - block
    b404 - block
    b218 - block
    b645 - block
    b649 - block
    b290 - block
    b309 - block
    b90 - block
    b682 - block
    b865 - block
    b291 - block
    b861 - block
    b701 - block
    b159 - block
    b873 - block
    b543 - block
    b109 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b161 )
    ( on b177 b161 )
    ( on b728 b177 )
    ( on b22 b728 )
    ( on b201 b22 )
    ( on b936 b201 )
    ( on b671 b936 )
    ( on b870 b671 )
    ( on b390 b870 )
    ( on b743 b390 )
    ( on b971 b743 )
    ( on b229 b971 )
    ( on b416 b229 )
    ( on b892 b416 )
    ( on b960 b892 )
    ( on b205 b960 )
    ( on b764 b205 )
    ( on b347 b764 )
    ( on b35 b347 )
    ( on b311 b35 )
    ( on b404 b311 )
    ( on b218 b404 )
    ( on b645 b218 )
    ( on b649 b645 )
    ( on b290 b649 )
    ( on b309 b290 )
    ( on b90 b309 )
    ( on b682 b90 )
    ( on b865 b682 )
    ( on b291 b865 )
    ( on b861 b291 )
    ( on b701 b861 )
    ( on b159 b701 )
    ( on b873 b159 )
    ( on b543 b873 )
    ( on b109 b543 )
    ( clear b109 )
  )
  ( :goal
    ( and
      ( clear b161 )
    )
  )
)

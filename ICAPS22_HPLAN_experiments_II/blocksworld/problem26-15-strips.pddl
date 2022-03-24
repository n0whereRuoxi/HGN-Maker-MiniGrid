( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b784 - block
    b46 - block
    b607 - block
    b893 - block
    b328 - block
    b163 - block
    b827 - block
    b478 - block
    b338 - block
    b633 - block
    b311 - block
    b68 - block
    b774 - block
    b934 - block
    b982 - block
    b631 - block
    b77 - block
    b734 - block
    b961 - block
    b688 - block
    b714 - block
    b84 - block
    b208 - block
    b344 - block
    b216 - block
    b348 - block
    b139 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b784 )
    ( on b46 b784 )
    ( on b607 b46 )
    ( on b893 b607 )
    ( on b328 b893 )
    ( on b163 b328 )
    ( on b827 b163 )
    ( on b478 b827 )
    ( on b338 b478 )
    ( on b633 b338 )
    ( on b311 b633 )
    ( on b68 b311 )
    ( on b774 b68 )
    ( on b934 b774 )
    ( on b982 b934 )
    ( on b631 b982 )
    ( on b77 b631 )
    ( on b734 b77 )
    ( on b961 b734 )
    ( on b688 b961 )
    ( on b714 b688 )
    ( on b84 b714 )
    ( on b208 b84 )
    ( on b344 b208 )
    ( on b216 b344 )
    ( on b348 b216 )
    ( on b139 b348 )
    ( clear b139 )
  )
  ( :goal
    ( and
      ( clear b784 )
    )
  )
)

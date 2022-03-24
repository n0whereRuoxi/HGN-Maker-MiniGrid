( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b323 - block
    b649 - block
    b258 - block
    b101 - block
    b563 - block
    b482 - block
    b959 - block
    b591 - block
    b65 - block
    b163 - block
    b85 - block
    b151 - block
    b225 - block
    b577 - block
    b521 - block
    b692 - block
    b492 - block
    b952 - block
    b107 - block
    b594 - block
    b405 - block
    b787 - block
    b186 - block
    b142 - block
    b3 - block
    b721 - block
    b699 - block
    b586 - block
    b399 - block
    b503 - block
    b218 - block
    b135 - block
    b870 - block
    b411 - block
    b786 - block
    b777 - block
    b210 - block
    b942 - block
    b167 - block
    b330 - block
    b332 - block
    b719 - block
    b669 - block
    b472 - block
    b468 - block
    b815 - block
    b772 - block
    b911 - block
    b246 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b323 )
    ( on b649 b323 )
    ( on b258 b649 )
    ( on b101 b258 )
    ( on b563 b101 )
    ( on b482 b563 )
    ( on b959 b482 )
    ( on b591 b959 )
    ( on b65 b591 )
    ( on b163 b65 )
    ( on b85 b163 )
    ( on b151 b85 )
    ( on b225 b151 )
    ( on b577 b225 )
    ( on b521 b577 )
    ( on b692 b521 )
    ( on b492 b692 )
    ( on b952 b492 )
    ( on b107 b952 )
    ( on b594 b107 )
    ( on b405 b594 )
    ( on b787 b405 )
    ( on b186 b787 )
    ( on b142 b186 )
    ( on b3 b142 )
    ( on b721 b3 )
    ( on b699 b721 )
    ( on b586 b699 )
    ( on b399 b586 )
    ( on b503 b399 )
    ( on b218 b503 )
    ( on b135 b218 )
    ( on b870 b135 )
    ( on b411 b870 )
    ( on b786 b411 )
    ( on b777 b786 )
    ( on b210 b777 )
    ( on b942 b210 )
    ( on b167 b942 )
    ( on b330 b167 )
    ( on b332 b330 )
    ( on b719 b332 )
    ( on b669 b719 )
    ( on b472 b669 )
    ( on b468 b472 )
    ( on b815 b468 )
    ( on b772 b815 )
    ( on b911 b772 )
    ( on b246 b911 )
    ( clear b246 )
  )
  ( :goal
    ( and
      ( clear b323 )
    )
  )
)

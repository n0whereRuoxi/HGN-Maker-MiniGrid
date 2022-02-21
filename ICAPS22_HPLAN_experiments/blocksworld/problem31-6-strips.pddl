( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b209 - block
    b651 - block
    b800 - block
    b561 - block
    b898 - block
    b884 - block
    b472 - block
    b65 - block
    b915 - block
    b584 - block
    b243 - block
    b194 - block
    b752 - block
    b772 - block
    b518 - block
    b874 - block
    b216 - block
    b263 - block
    b251 - block
    b59 - block
    b777 - block
    b45 - block
    b769 - block
    b646 - block
    b760 - block
    b812 - block
    b218 - block
    b42 - block
    b464 - block
    b826 - block
    b131 - block
    b715 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b209 )
    ( on b651 b209 )
    ( on b800 b651 )
    ( on b561 b800 )
    ( on b898 b561 )
    ( on b884 b898 )
    ( on b472 b884 )
    ( on b65 b472 )
    ( on b915 b65 )
    ( on b584 b915 )
    ( on b243 b584 )
    ( on b194 b243 )
    ( on b752 b194 )
    ( on b772 b752 )
    ( on b518 b772 )
    ( on b874 b518 )
    ( on b216 b874 )
    ( on b263 b216 )
    ( on b251 b263 )
    ( on b59 b251 )
    ( on b777 b59 )
    ( on b45 b777 )
    ( on b769 b45 )
    ( on b646 b769 )
    ( on b760 b646 )
    ( on b812 b760 )
    ( on b218 b812 )
    ( on b42 b218 )
    ( on b464 b42 )
    ( on b826 b464 )
    ( on b131 b826 )
    ( on b715 b131 )
    ( clear b715 )
  )
  ( :goal
    ( and
      ( clear b209 )
    )
  )
)

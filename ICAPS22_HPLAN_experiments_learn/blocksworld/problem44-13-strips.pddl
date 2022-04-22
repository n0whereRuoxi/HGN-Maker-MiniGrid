( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b33 - block
    b327 - block
    b877 - block
    b850 - block
    b383 - block
    b675 - block
    b143 - block
    b752 - block
    b788 - block
    b268 - block
    b378 - block
    b665 - block
    b561 - block
    b581 - block
    b711 - block
    b671 - block
    b585 - block
    b296 - block
    b362 - block
    b804 - block
    b631 - block
    b708 - block
    b222 - block
    b458 - block
    b158 - block
    b983 - block
    b806 - block
    b213 - block
    b511 - block
    b795 - block
    b321 - block
    b264 - block
    b385 - block
    b814 - block
    b894 - block
    b197 - block
    b519 - block
    b981 - block
    b107 - block
    b692 - block
    b777 - block
    b93 - block
    b172 - block
    b239 - block
    b376 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b33 )
    ( on b327 b33 )
    ( on b877 b327 )
    ( on b850 b877 )
    ( on b383 b850 )
    ( on b675 b383 )
    ( on b143 b675 )
    ( on b752 b143 )
    ( on b788 b752 )
    ( on b268 b788 )
    ( on b378 b268 )
    ( on b665 b378 )
    ( on b561 b665 )
    ( on b581 b561 )
    ( on b711 b581 )
    ( on b671 b711 )
    ( on b585 b671 )
    ( on b296 b585 )
    ( on b362 b296 )
    ( on b804 b362 )
    ( on b631 b804 )
    ( on b708 b631 )
    ( on b222 b708 )
    ( on b458 b222 )
    ( on b158 b458 )
    ( on b983 b158 )
    ( on b806 b983 )
    ( on b213 b806 )
    ( on b511 b213 )
    ( on b795 b511 )
    ( on b321 b795 )
    ( on b264 b321 )
    ( on b385 b264 )
    ( on b814 b385 )
    ( on b894 b814 )
    ( on b197 b894 )
    ( on b519 b197 )
    ( on b981 b519 )
    ( on b107 b981 )
    ( on b692 b107 )
    ( on b777 b692 )
    ( on b93 b777 )
    ( on b172 b93 )
    ( on b239 b172 )
    ( on b376 b239 )
    ( clear b376 )
  )
  ( :goal
    ( and
      ( clear b33 )
    )
  )
)

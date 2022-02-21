( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b213 - block
    b95 - block
    b958 - block
    b601 - block
    b322 - block
    b877 - block
    b436 - block
    b90 - block
    b693 - block
    b912 - block
    b675 - block
    b396 - block
    b3 - block
    b882 - block
    b836 - block
    b359 - block
    b746 - block
    b8 - block
    b218 - block
    b227 - block
    b901 - block
    b639 - block
    b171 - block
    b775 - block
    b550 - block
    b856 - block
    b82 - block
    b752 - block
    b312 - block
    b574 - block
    b293 - block
    b53 - block
    b236 - block
    b985 - block
    b778 - block
    b254 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b213 b728 )
    ( on b95 b213 )
    ( on b958 b95 )
    ( on b601 b958 )
    ( on b322 b601 )
    ( on b877 b322 )
    ( on b436 b877 )
    ( on b90 b436 )
    ( on b693 b90 )
    ( on b912 b693 )
    ( on b675 b912 )
    ( on b396 b675 )
    ( on b3 b396 )
    ( on b882 b3 )
    ( on b836 b882 )
    ( on b359 b836 )
    ( on b746 b359 )
    ( on b8 b746 )
    ( on b218 b8 )
    ( on b227 b218 )
    ( on b901 b227 )
    ( on b639 b901 )
    ( on b171 b639 )
    ( on b775 b171 )
    ( on b550 b775 )
    ( on b856 b550 )
    ( on b82 b856 )
    ( on b752 b82 )
    ( on b312 b752 )
    ( on b574 b312 )
    ( on b293 b574 )
    ( on b53 b293 )
    ( on b236 b53 )
    ( on b985 b236 )
    ( on b778 b985 )
    ( on b254 b778 )
    ( on b806 b254 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b728 )
    )
  )
)

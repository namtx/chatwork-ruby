module ChatWork
  class MyTask < Entity
    install_class_operations :_get

    # Get the list of all unfinished tasks
    #
    # (*This method returns up to 100 entries. We are planning to implement pagination to support larger number of data retrieval)
    #
    # @see http://developer.chatwork.com/ja/endpoint_my.html#GET-my-tasks
    #
    # @param assigned_by_account_id [Integer] Account ID of the person who assigned task
    # @param status [String] Task status (open, done)
    #
    # @return [Array<Hash>]
    #
    # @example response format
    #   [
    #     {
    #       "task_id": 3,
    #       "room": {
    #         "room_id": 5,
    #         "name": "Group Chat Name",
    #         "icon_path": "https://example.com/ico_group.png"
    #       },
    #       "assigned_by_account": {
    #         "account_id": 456,
    #         "name": "Anna",
    #         "avatar_image_url": "https://example.com/def.png"
    #       },
    #       "message_id": "13",
    #       "body": "buy milk",
    #       "limit_time": 1384354799,
    #       "status": "open"
    #     }
    #   ]
    def self.get(assigned_by_account_id: nil, status: nil)
      params = {
        assigned_by_account_id: assigned_by_account_id,
        status:                 status,
      }

      _get(hash_compact(params))
    end

    def self.path
      "/my/tasks"
    end

    def path
      "/my/tasks"
    end
  end
end

# This migration comes from mailboxer_engine (originally 20110511145103)
class CreateMailboxer < ActiveRecord::Migration
  def self.up    
  #Tables
  	#Conversations
    create_table :mailboxer_conversations do |t|
      t.column :subject, :string, :default => ""
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
    end    
  	#Receipts
    create_table :mailboxer_receipts do |t|
      t.references :receiver, :polymorphic => true
      t.column :notification_id, :integer, :null => false
      t.column :is_read, :boolean, :default => false
      t.column :trashed, :boolean, :default => false
      t.column :deleted, :boolean, :default => false
      t.column :mailbox_type, :string, :limit => 25
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
    end    
  	#Notifications and Messages
    create_table :mailboxer_notifications do |t|
      t.column :type, :string
      t.column :body, :text
      t.column :subject, :string, :default => ""
      t.references :sender, :polymorphic => true
      t.column :conversation_id, :integer
      t.column :draft, :boolean, :default => false
      t.string :notification_code, :default => nil
      t.references :notified_object, :polymorphic => true
      t.column :attachment, :string
      t.column :updated_at, :datetime, :null => false
      t.column :created_at, :datetime, :null => false
      t.boolean :global, default: false
      t.datetime :expires
    end    
    
  #Indexes
  	#Conversations
  	#Receipts
  	add_index "mailboxer_receipts","notification_id"

  	#Messages  
  	add_index "mailboxer_notifications","conversation_id"
  
  #Foreign keys    
  	#Conversations
  	#Receipts
  	add_foreign_key "mailboxer_receipts", "mailboxer_notifications", :name => "receipts_on_notification_id", :column => "notification_id"
  	#Messages  
  	add_foreign_key "mailboxer_notifications", "mailboxer_conversations", :name => "notifications_on_conversation_id", :column => "conversation_id"

    create_table :mailboxer_conversation_opt_outs do |t|
      t.references :unsubscriber, :polymorphic => true
      t.references :conversation
    end
    add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", :name => "mb_opt_outs_on_conversations_id", :column => "conversation_id"

    # We'll explicitly specify its name, as the auto-generated name is too long and exceeds 63
    # characters limitation.
    add_index :mailboxer_conversation_opt_outs, [:unsubscriber_id, :unsubscriber_type],
      name: 'index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type'
    add_index :mailboxer_conversation_opt_outs, :conversation_id

    add_index :mailboxer_notifications, :type
    add_index :mailboxer_notifications, [:sender_id, :sender_type]

    # We'll explicitly specify its name, as the auto-generated name is too long and exceeds 63
    # characters limitation.
    add_index :mailboxer_notifications, [:notified_object_id, :notified_object_type],
      name: 'index_mailboxer_notifications_on_notified_object_id_and_type'

    add_index :mailboxer_receipts, [:receiver_id, :receiver_type]

  end
  
  def self.down
    remove_foreign_key "mailboxer_conversation_opt_outs", :name => "mb_opt_outs_on_conversations_id"
    drop_table :mailboxer_conversation_opt_outs

  #Tables  	
  	remove_foreign_key "mailboxer_receipts", :name => "receipts_on_notification_id"
  	remove_foreign_key "mailboxer_notifications", :name => "notifications_on_conversation_id"
  	
  #Indexes
    drop_table :mailboxer_receipts
    drop_table :mailboxer_conversations
    drop_table :mailboxer_notifications
  end
end
